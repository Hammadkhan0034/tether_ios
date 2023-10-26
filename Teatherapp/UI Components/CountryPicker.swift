//
//  CountryPicker.swift
//  Teatherapp
//
//  Created by Auxilium.Digital on 21/10/2023.
//
// https://github.com/Scavo-73/CountryPickerSwiftUI

import SwiftUI

public struct CountryPicker: View {
    
    @Binding var phoneCode : String
    @State var foregroundColor : Color
    @State var showList: Bool = false
    @State var country: Country = Country(countryCode: "", name: "", currencyCode: "", currencySimbol: "", phoneCode: "", flag: "")
    
    var list: [Country] = getAllCountries()
    
    public var body: some View {
        VStack{
            Button(action: {
                showList = true
            }, label: {
                HStack{
//                    Text(country.flag)
//                        .frame(width: 24, height: 24)
//                    Text(country.name)
                    Text(country.countryCode)
//                    Text(country.currencyCode)
//                    Text(country.currencySimbol)
                    Text("+\(country.phoneCode.isEmpty ? "Select" : country.phoneCode)")
                    Image(systemName: "arrowtriangle.down.fill")
                        .resizable()
                        .frame(width: 10, height: 8)
                        .padding(.trailing)
                }
                .font(.system(size: 16))
                .foregroundColor(self.foregroundColor)
            })
            .sheet(isPresented: $showList, onDismiss: {
                showList = false
            }) {
                ListView(showCountries: $showList, countrySelected: $country)
            }
        }
        .onAppear{
            let slectedCountry = self.list.first {
                $0.phoneCode == phoneCode
            }
            self.country = Country(countryCode: slectedCountry?.countryCode ?? "",
                                   name: slectedCountry?.name ?? "",
                                   currencyCode: slectedCountry?.currencyCode ?? "",
                                   currencySimbol: slectedCountry?.currencySimbol ?? "",
                                   phoneCode: slectedCountry?.phoneCode ?? "",
                                   flag: slectedCountry?.flag ?? "")
        }
        .onChange(of: country) { newValue in
            self.phoneCode = newValue.phoneCode
            print("test: phone code changed \(self.phoneCode)")
        }
    }
}


//MARK: - Second View
public struct ListView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var searchText = ""
    
    @Binding var showCountries: Bool
    @Binding var countrySelected: Country
    
    var list: [Country] = getAllCountries()
    
    let rightToLeftLanguage: Bool = isRightToLeft
    
    public var body: some View {
        NavigationView {
            VStack {
                HStack{
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Search...", text: $searchText, onEditingChanged: {_ in }, onCommit: {}).foregroundColor(.primary)
                        Button(action: {
                            self.searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .opacity(searchText == "" ? 0 : 1)
                        }
                    }
                    .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                    .foregroundColor(.secondary)
                    .background(Color.white)
                    .cornerRadius(10.0)
                    .environment(\.layoutDirection, rightToLeftLanguage ? .rightToLeft : .leftToRight)
                    
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Cancel")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                    })
                }
                .padding()
                
                List{
                    ForEach(Array(searchResults.enumerated()), id: \.element) { index, element in
                        Button(action: {
                            countrySelected = element
                            showCountries = false
                            print(element.name)
                            
                            
                        }, label: {
                            VStack {
                                HStack{
                                    Text(element.flag)
                                        .font(.system(size: 35))
                                    
                                    Text(element.name)
                                    
                                    Text("(\(element.countryCode))")
                                    
                                    Spacer()
                                    
                                    if showCountries {
                                        Text("+\(element.phoneCode)")
                                    }
                                }
                                .fontWeight(.bold)
                                //                                .foregroundColor(self.countrySelected == element ? Color.white : AppColors.textNavy100Color)
                                .environment(\.layoutDirection, rightToLeftLanguage ? .rightToLeft : .leftToRight)
                            }
                            .padding(.horizontal, 20)
                        })
                        .listRowBackground(Color.clear)
                        //                        .background(self.countrySelected == element ? AppColors.violet100Color : Color.clear)
                        .cornerRadius(10.0)
                    }
                }
                //                .background(AppColors.viewBackgroundColor)
                .padding(.horizontal, -30)
            }
            //            .background(AppColors.violet100Color)
            .navigationBarHidden(true)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    var searchResults: [Country] {
        if searchText.isEmpty {
            return list
        } else {
            return list.filter { $0.name.contains(searchText) }
        }
    }
}

//MARK: - ThirdView
struct Country: Hashable {
    var countryCode: String
    var name: String
    var currencyCode: String
    var currencySimbol: String
    var phoneCode: String
    var flag: String
}

func getAllCountries() -> [Country] {
    
    var countries = [Country]()
    
    for code in NSLocale.isoCountryCodes {
        
        let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
        let name = NSLocale(localeIdentifier: "en_US").displayName(forKey: NSLocale.Key.identifier, value: id)!
        let locale = NSLocale.init(localeIdentifier: id)
        let countryCode = locale.object(forKey: NSLocale.Key.countryCode) as? String
        let currencySymbol = locale.object(forKey: NSLocale.Key.currencySymbol) as? String
        let phoneCode = NSLocale().extensionCode(countryCode: countryCode ?? "")
        
        let newCountry = Country(countryCode: countryCode ?? "no code", name: name, currencyCode: countryCode  ?? "no code", currencySimbol: currencySymbol  ?? "no code", phoneCode: phoneCode ?? "", flag: String.flag(for: code) ?? "no code")
        
        countries.append(newCountry)
    }
    return countries
}

var isRightToLeft: Bool {
    if let languageArray = UserDefaults.standard.value(forKey: "AppleLanguages") as? Array<String>,
       let languageObj = languageArray.first {
        let direction = Locale.characterDirection(forLanguage: languageObj)
        switch direction {
        case .leftToRight:
            return false
        case .rightToLeft:
            return true
        default:
            return false
        }
    }
    return false
}

extension String {
    static func flag(for code: String) -> String? {
        func isLowercaseASCIIScalar(_ scalar: Unicode.Scalar) -> Bool {
            return scalar.value >= 0x61 && scalar.value <= 0x7A
        }
        func regionlaInidicatorSymbol(for scalar: Unicode.Scalar) -> Unicode.Scalar {
            precondition(isLowercaseASCIIScalar(scalar))
            return Unicode.Scalar(scalar.value + (0x1F1E6 - 0x61))!
        }
        let lowercasedCode = code.lowercased()
        guard lowercasedCode.count == 2 else { return nil }
        guard lowercasedCode.unicodeScalars.reduce(true, { accum, scalar in accum && isLowercaseASCIIScalar(scalar) }) else {return nil}
        
        let indicatorSymbol =  lowercasedCode.unicodeScalars.map({regionlaInidicatorSymbol(for: $0)})
        
        return String(indicatorSymbol.map({ Character($0)}))
    }
}

extension NSLocale {
    func extensionCode(countryCode: String) -> String? {
        let prefixCode = ["AC":"247",
                          "AD":"376",
                          "AE":"971",
                          "AF":"93",
                          "AG":"1",
                          "AI":"1",
                          "AL":"355",
                          "AM":"374",
                          "AN":"599",
                          "AO":"244",
                          "AQ":"672",
                          "AR":"54",
                          "AS":"1",
                          "AT":"43",
                          "AU":"61",
                          "AW":"297",
                          "AX":"248",
                          "AZ":"994",
                          "BA":"387",
                          "BB":"1",
                          "BD":"880",
                          "BE":"32",
                          "BF":"226",
                          "BG":"359",
                          "BH":"973",
                          "BI":"257",
                          "BJ":"229",
                          "BL":"590",
                          "BM":"1",
                          "BN":"673",
                          "BO":"591",
                          "BQ":"599",
                          "BR":"55",
                          "BS":"1",
                          "BT":"975",
                          "BV":"47",
                          "BW":"267",
                          "BY":"375",
                          "BZ":"501",
                          "CA":"1",
                          "CC":"61",
                          "CD":"243",
                          "CF":"236",
                          "CG":"242",
                          "CH":"41",
                          "CI":"225",
                          "CK":"682",
                          "CL":"56",
                          "CM":"237",
                          "CN":"86",
                          "CO":"57",
                          "CP":"689",
                          "CR":"506",
                          "CU":"53",
                          "CV":"238",
                          "CW":"599",
                          "CX":"61",
                          "CY":"537",
                          "CZ":"420",
                          "DE":"49",
                          "DG":"246",
                          "DJ":"253",
                          "DK":"45",
                          "DM":"1",
                          "DO":"1",
                          "DZ":"213",
                          "EA":"34",
                          "EC":"593",
                          "EE":"372",
                          "EG":"20",
                          "EH":"212",
                          "ER":"291",
                          "ES":"34",
                          "ET":"251",
                          "FI":"358",
                          "FJ":"679",
                          "FK":"500",
                          "FM":"691",
                          "FO":"298",
                          "FR":"33",
                          "GA":"241",
                          "GB":"44",
                          "GD":"1",
                          "GE":"995",
                          "GF":"594",
                          "GG":"44",
                          "GH":"233",
                          "GI":"350",
                          "GL":"299",
                          "GM":"220",
                          "GN":"224",
                          "GP":"590",
                          "GQ":"240",
                          "GR":"30",
                          "GS":"500",
                          "GT":"502",
                          "GU":"1",
                          "GW":"245",
                          "GY":"595",
                          "HK":"852",
                          "HM":"334",
                          "HN":"504",
                          "HR":"385",
                          "HT":"509",
                          "HU":"36",
                          "IC":"34",
                          "ID":"62",
                          "IE":"353",
                          "IL":"972",
                          "IM":"44",
                          "IN":"91",
                          "IO":"246",
                          "IQ":"964",
                          "IR":"98",
                          "IS":"354",
                          "IT":"39",
                          "JE":"44",
                          "JM":"1",
                          "JO":"962",
                          "JP":"81",
                          "KE":"254",
                          "KG":"996",
                          "KH":"855",
                          "KI":"686",
                          "KM":"269",
                          "KN":"1",
                          "KP":"850",
                          "KR":"82",
                          "KW":"965",
                          "KY":"345",
                          "KZ":"77",
                          "LA":"856",
                          "LB":"961",
                          "LC":"1",
                          "LI":"423",
                          "LK":"94",
                          "LR":"231",
                          "LS":"266",
                          "LT":"370",
                          "LU":"352",
                          "LV":"371",
                          "LY":"218",
                          "MA":"212",
                          "MC":"377",
                          "MD":"373",
                          "ME":"382",
                          "MF":"590",
                          "MG":"261",
                          "MH":"692",
                          "MK":"389",
                          "ML":"223",
                          "MM":"95",
                          "MN":"976",
                          "MO":"853",
                          "MP":"1",
                          "MQ":"596",
                          "MR":"222",
                          "MS":"1",
                          "MT":"356",
                          "MU":"230",
                          "MV":"960",
                          "MW":"265",
                          "MX":"52",
                          "MY":"60",
                          "MZ":"258",
                          "NA":"264",
                          "NC":"687",
                          "NE":"227",
                          "NF":"672",
                          "NG":"234",
                          "NI":"505",
                          "NL":"31",
                          "NO":"47",
                          "NP":"977",
                          "NR":"674",
                          "NU":"683",
                          "NZ":"64",
                          "OM":"968",
                          "PA":"507",
                          "PE":"51",
                          "PF":"689",
                          "PG":"675",
                          "PH":"63",
                          "PK":"92",
                          "PL":"48",
                          "PM":"508",
                          "PN":"872",
                          "PR":"1",
                          "PS":"970",
                          "PT":"351",
                          "PW":"680",
                          "PY":"595",
                          "QA":"974",
                          "RE":"262",
                          "RO":"40",
                          "RS":"381",
                          "RU":"7",
                          "RW":"250",
                          "SA":"966",
                          "SB":"677",
                          "SC":"248",
                          "SD":"249",
                          "SE":"46",
                          "SG":"65",
                          "SH":"290",
                          "SI":"386",
                          "SJ":"47",
                          "SK":"421",
                          "SL":"232",
                          "SM":"378",
                          "SN":"221",
                          "SO":"252",
                          "SR":"597",
                          "SS":"211",
                          "ST":"239",
                          "SV":"503",
                          "SX":"721",
                          "SY":"963",
                          "SZ":"268",
                          "TA":"290",
                          "TC":"1",
                          "TD":"235",
                          "TF":"260",
                          "TG":"228",
                          "TH":"66",
                          "TJ":"992",
                          "TK":"690",
                          "TL":"670",
                          "TM":"993",
                          "TN":"216",
                          "TO":"676",
                          "TR":"90",
                          "TT":"1",
                          "TV":"688",
                          "TW":"886",
                          "TZ":"255",
                          "UA":"380",
                          "UG":"256",
                          "UM":"581",
                          "US":"1",
                          "UY":"598",
                          "UZ":"998",
                          "VA":"379",
                          "VC":"1",
                          "VE":"58",
                          "VG":"284",
                          "VI":"340",
                          "VN":"84",
                          "VU":"678",
                          "WF":"681",
                          "WS":"685",
                          "XK":"383",
                          "YE":"967",
                          "YT":"262",
                          "ZA":"27",
                          "ZM":"260",
                          "ZW":"263"]
        
        let countryDialingCode = prefixCode[countryCode] ?? nil
        return countryDialingCode
    }
}

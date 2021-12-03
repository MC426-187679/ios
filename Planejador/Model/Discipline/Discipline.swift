import Foundation

struct Discipline: Decodable {
    let code: String
    let name: String
    let credits: Int
    let syllabus: String
    let requirements: [Requirement]?
    let requiredBy: [String]?

    static func allDisciplines(completion: @escaping ([Discipline]) -> Void) {
        let urls = disciplineNames.compactMap { filename in
            Bundle.main.url(forResource: filename, withExtension: nil)
        }

        let disciplines = urls.flatMap { decode(url: $0) ?? [] }
        completion(disciplines)
    }

    private static func decode(url: URL) -> [Discipline]? {
        if let data = try? Data(contentsOf: url) {
            return try? JSONDecoder().decode([Discipline].self, from: data)
        }

        return nil
    }

    static var disciplineNames: [String] {
        [
            "AC.json", "AD.json", "AG.json", "AI.json", "AM.json", "AP.json", "AR.json",
            "AU.json", "BA.json", "BB.json", "BC.json", "BD.json", "BE.json", "BF.json",
            "BG.json", "BH.json", "BI.json", "BL.json", "BM.json", "BP.json", "BS.json",
            "BT.json", "BV.json", "BZ.json", "CE.json", "CG.json", "CP.json", "CS.json",
            "CV.json", "DB.json", "DC.json", "DE.json", "DM.json", "DO.json", "DS.json",
            "EA.json", "EB.json", "EC.json", "EE.json", "EF.json", "EG.json", "EL.json",
            "EM.json", "EN.json", "EP.json", "EQ.json", "ER.json", "ES.json", "ET.json",
            "EU.json", "EX.json", "FA.json", "FI.json", "FL.json", "FM.json", "FN.json",
            "FR.json", "FT.json", "F_.json", "GE.json", "GF.json", "GL.json", "GM.json",
            "GN.json", "GT.json", "HG.json", "HH.json", "HL.json", "HZ.json", "LA.json",
            "LE.json", "LG.json", "LT.json", "MA.json", "MC.json", "MD.json", "ME.json",
            "MG.json", "MH.json", "ML.json", "MP.json", "MS.json", "MU.json", "NC.json",
            "NT.json", "PF.json", "PG.json", "QA.json", "QF.json", "QG.json", "QI.json",
            "QL.json", "QO.json", "SI.json", "SL.json", "ST.json", "TA.json", "TL.json",
            "TT.json"
        ]
    }
}

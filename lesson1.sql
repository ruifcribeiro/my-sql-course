-- List of patients in Kingston
SELECT
    PatientId
    ,AdmittedDate
    ,DischargeDate
    ,DATEDIFF(DAY, AdmittedDate, DischargeDate) AS LenghtOfStay
    ,DATEADD(WEEK, -2, AdmittedDate) AS ReminderDate
    --2 weeks before admission
    ,DATEADD(MONTH, 3, DischargeDate) AS AppointmentDate
    --3 months after discharge date
    ,Hospital
    ,Ward
    ,Tariff
FROM
    PatientStay
WHERE Hospital IN ('Kingston', 'PRUH')
--ORDER BY Hospital ASC, Ward ASC, Tariff DESC
ORDER BY PatientId DESC

-- AND Ward LIKE '%Surgery%'
-- And AdmittedDate = '2024-02-27'
-- AND AdmittedDate BETWEEN '2024-02-27' AND '2024-03-02'
-- AND Tariff < 6
-- OR Hospital = 'PRUH'
-- AND Ward = 'Dermatology'

--summarise data

SELECT
    Hospital
    ,Ward
    ,COUNT(*) AS NumberOfPatients
    ,SUM(Tariff) AS TotalTariff

FROM
    PatientStay
GROUP BY Hospital, Ward

SELECT
    ps.PatientId
    ,ps.AdmittedDate
    ,ps.Hospital
    ,h.Hospital
    ,h.HospitalType
    ,h.HospitalSize
FROM
    PatientStay ps FULL OUTER JOIN DimHospitalBad h ON ps.Hospital = h.Hospital
--WHERE h.HospitalType = 'Teaching'

SELECT * FROM DimHospitalBad



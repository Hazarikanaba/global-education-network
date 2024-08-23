// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EducationNetwork {
    struct Certificate {
        string studentName;
        string courseName;
        string institutionName;
        uint256 dateIssued;
    }

    mapping(bytes32 => Certificate) public certificates;

    function issueCertificate(
        string memory _studentName,
        string memory _courseName,
        string memory _institutionName,
        uint256 _dateIssued
    ) public returns (bytes32) {
        // Generate a unique ID for the certificate
        bytes32 certificateId = keccak256(
            abi.encodePacked(_studentName, _courseName, _institutionName, _dateIssued)
        );

        // Store the certificate on the blockchain
        certificates[certificateId] = Certificate(
            _studentName,
            _courseName,
            _institutionName,
            _dateIssued
        );

        return certificateId;
    }

    function verifyCertificate(bytes32 _certificateId)
        public
        view
        returns (
            string memory,
            string memory,
            string memory,
            uint256
        )
    {
        Certificate memory cert = certificates[_certificateId];
        return (
            cert.studentName,
            cert.courseName,
            cert.institutionName,
            cert.dateIssued
        );
    }
}


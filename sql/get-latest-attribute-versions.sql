SELECT attribute.* FROM (
    SELECT MAX(a.version) AS version, a.proposalId, a.additionalId, a.name
      FROM xcolab_ProposalAttribute a
      GROUP BY a.proposalId, a.additionalId, a.name
  ) AS maxAttribute
  INNER JOIN xcolab_ProposalAttribute attribute
    ON maxAttribute.proposalId = attribute.proposalId
      and maxAttribute.additionalId = attribute.additionalId
      and maxAttribute.name = attribute.name
      AND maxAttribute.version = attribute.version;

-- You can also create this as a view by prepending this to the statement:
-- CREATE OR REPLACE VIEW view__xcolab_ProposalAttribute__latest as

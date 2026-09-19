select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v3 + p.v1 as v1,
    coalesce(p.v1, 0) + 7 as v2,
    p.v1 + p.v3 as v3,
    round(p.v1 / 7.0, 4) as v4,
    p.v3 + 2 as v5,
    round(p.v1 / 13.0, 4) as v6,
    case when p.v3 > 500 then p.v3 else 0 end as v7
from {{ ref('int_ev_0011') }} as p

select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v2 * 7 as v1,
    case when p.v2 > p.v1 then p.v2 else p.v1 end as v2,
    round(p.v1 / 3.0, 4) as v3,
    coalesce(p.v1, 0) + 5 as v4,
    case when p.v2 > 500 then p.v2 else 0 end as v5,
    coalesce(p.v2, 0) + 13 as v6,
    p.v1 + 11 as v7
from {{ ref('int_ev_0011') }} as p

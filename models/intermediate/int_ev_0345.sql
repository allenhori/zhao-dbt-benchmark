select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v1 * 11 as v1,
    case when p.v1 > p.v4 then p.v1 else p.v4 end as v2,
    coalesce(p.v4, 0) + 7 as v3,
    p.v4 + 5 as v4,
    p.v4 * 0.5 + p.v1 * 0.5 as v5,
    p.v1 + 2 as v6,
    coalesce(p.v1, 0) + 7 as v7
from {{ ref('int_ev_0165') }} as p

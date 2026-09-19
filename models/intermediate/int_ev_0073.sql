select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v2, 0) + 11 as v1,
    p.v2 - p.v1 as v2,
    case when p.v6 > p.v2 then p.v6 else p.v2 end as v3,
    p.v1 + p.v6 as v4,
    coalesce(p.v6, 0) + 3 as v5,
    p.v6 * 0.5 + p.v2 * 0.5 as v6
from {{ ref('int_ev_0011') }} as p

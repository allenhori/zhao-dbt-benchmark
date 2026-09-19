select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v1 * 2 as v1,
    case when p.v2 > 300 then p.v2 else 0 end as v2,
    coalesce(p.v1, 0) + 13 as v3,
    p.v1 + 13 as v4,
    coalesce(p.v1, 0) + 7 as v5,
    p.v1 * 5 as v6
from {{ ref('int_ev_0011') }} as p

select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v2 * 5 as v1,
    case when p.v7 > 1100 then p.v7 else 0 end as v2,
    p.v2 + 7 as v3,
    p.v2 - p.v7 as v4,
    case when p.v7 > 500 then p.v7 else 0 end as v5,
    p.v7 * 0.5 + p.v2 * 0.5 as v6
from {{ ref('int_ev_0107') }} as p

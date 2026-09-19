select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v2 > 300 then p.v2 else 0 end as v1,
    coalesce(p.v7, 0) + 7 as v2,
    p.v7 + p.v2 as v3,
    p.v7 + 5 as v4,
    p.v2 * 0.5 + p.v7 * 0.5 as v5,
    p.v2 - p.v7 as v6
from {{ ref('int_ev_0380') }} as p

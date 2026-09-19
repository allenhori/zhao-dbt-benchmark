select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v3 > 300 then p.v3 else 0 end as v1,
    case when p.v1 > 700 then p.v1 else 0 end as v2,
    coalesce(p.v3, 0) + 7 as v3,
    p.v1 + 13 as v4,
    p.v3 * 2 as v5,
    p.v3 * 5 as v6
from {{ ref('int_ev_0146') }} as p

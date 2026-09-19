select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v1 > 200 then p.v1 else 0 end as v1,
    case when p.v2 > p.v1 then p.v2 else p.v1 end as v2,
    case when p.v1 > 1100 then p.v1 else 0 end as v3,
    p.v2 * 13 as v4,
    p.v1 + 5 as v5,
    coalesce(p.v1, 0) + 5 as v6
from {{ ref('int_ev_0015') }} as p

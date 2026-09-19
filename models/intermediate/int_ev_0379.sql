select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v3 > 700 then p.v3 else 0 end as v1,
    p.v5 * 11 as v2,
    case when p.v1 > 1100 then p.v1 else 0 end as v3,
    coalesce(p.v3, 0) + 5 as v4,
    p.v5 + p.v1 as v5,
    p.v1 + p.v3 as v6
from {{ ref('int_ev_0004') }} as p

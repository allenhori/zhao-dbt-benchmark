select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v3 + 3 as v1,
    case when p.v3 > 700 then p.v3 else 0 end as v2,
    p.v2 + 13 as v3,
    coalesce(p.v3, 0) + 13 as v4,
    p.v3 + 11 as v5,
    p.v3 + 5 as v6,
    p.v3 * 7 as v7,
    p.v2 + 7 as v8
from {{ ref('int_ev_0023') }} as p

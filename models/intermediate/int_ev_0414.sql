select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v2 * 3 as v1,
    p.v5 - p.v2 as v2,
    round(p.v5 / 2.0, 4) as v3,
    p.v5 * 7 as v4,
    p.v5 + 7 as v5,
    coalesce(p.v2, 0) + 3 as v6,
    case when p.v2 > 200 then p.v2 else 0 end as v7,
    p.v2 + 2 as v8
from {{ ref('int_ev_0013') }} as p

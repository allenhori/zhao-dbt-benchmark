select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v6 + 11 as v1,
    coalesce(p.v3, 0) + 3 as v2,
    round(p.v3 / 3.0, 4) as v3,
    case when p.v6 > 500 then p.v6 else 0 end as v4,
    p.v6 * 3 as v5,
    p.v6 * 11 as v6,
    p.v3 + 2 as v7,
    p.v3 + 3 as v8
from {{ ref('int_ev_0002') }} as p

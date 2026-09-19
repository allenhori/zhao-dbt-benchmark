select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v4 - p.v8 as v1,
    case when p.v4 > p.v8 then p.v4 else p.v8 end as v2,
    p.v6 * 5 as v3,
    p.v8 - p.v6 as v4,
    p.v8 + p.v4 as v5,
    round(p.v8 / 3.0, 4) as v6,
    round(p.v8 / 11.0, 4) as v7,
    coalesce(p.v6, 0) + 11 as v8
from {{ ref('int_ev_0002') }} as p

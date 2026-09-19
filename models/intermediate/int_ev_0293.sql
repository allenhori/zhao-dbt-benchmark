select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v8 + 3 as v1,
    coalesce(p.v8, 0) + 3 as v2,
    round(p.v1 / 3.0, 4) as v3,
    p.v1 * 7 as v4,
    p.v1 * 0.5 + p.v8 * 0.5 as v5,
    p.v1 * 0.5 + p.v8 * 0.5 as v6,
    case when p.v1 > 200 then p.v1 else 0 end as v7,
    round(p.v8 / 3.0, 4) as v8
from {{ ref('int_ev_0001') }} as p

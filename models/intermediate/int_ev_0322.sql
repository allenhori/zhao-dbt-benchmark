select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v2 * 7 as v1,
    coalesce(p.v2, 0) + 7 as v2,
    p.v2 * 0.5 + p.v6 * 0.5 as v3,
    round(p.v2 / 11.0, 4) as v4,
    p.v2 * 7 as v5,
    p.v8 * 0.5 + p.v6 * 0.5 as v6,
    case when p.v8 > 700 then p.v8 else 0 end as v7
from {{ ref('int_ev_0001') }} as p

select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v2 / 7.0, 4) as v1,
    case when p.v2 > 700 then p.v2 else 0 end as v2,
    case when p.v2 > 1300 then p.v2 else 0 end as v3,
    p.v2 * 0.5 + p.v3 * 0.5 as v4,
    coalesce(p.v2, 0) + 2 as v5,
    p.v2 * 0.5 + p.v3 * 0.5 as v6,
    p.v3 * 11 as v7,
    case when p.v3 > 300 then p.v3 else 0 end as v8
from {{ ref('int_ev_0029') }} as p

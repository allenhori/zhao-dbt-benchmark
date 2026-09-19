select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v2 / 2.0, 4) as v1,
    case when p.v2 > 200 then p.v2 else 0 end as v2,
    p.v7 * 3 as v3,
    p.v7 * 0.5 + p.v2 * 0.5 as v4,
    case when p.v2 > 1300 then p.v2 else 0 end as v5,
    p.v7 * 3 as v6,
    p.v7 * 5 as v7,
    round(p.v7 / 2.0, 4) as v8
from {{ ref('int_ev_0089') }} as p

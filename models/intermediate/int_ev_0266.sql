select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v3 * 0.5 + p.v4 * 0.5 as v1,
    p.v4 * 3 as v2,
    case when p.v4 > 1300 then p.v4 else 0 end as v3,
    p.v3 + 13 as v4,
    case when p.v4 > 500 then p.v4 else 0 end as v5,
    case when p.v3 > 700 then p.v3 else 0 end as v6,
    round(p.v4 / 5.0, 4) as v7,
    case when p.v4 > 1100 then p.v4 else 0 end as v8
from {{ ref('int_ev_0030') }} as p

select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v6 * 11 as v1,
    p.v3 * 0.5 + p.v6 * 0.5 as v2,
    case when p.v6 > 200 then p.v6 else 0 end as v3,
    case when p.v6 > 500 then p.v6 else 0 end as v4,
    case when p.v3 > 1300 then p.v3 else 0 end as v5,
    p.v6 * 13 as v6,
    case when p.v3 > 700 then p.v3 else 0 end as v7,
    round(p.v3 / 3.0, 4) as v8
from {{ ref('int_ev_0002') }} as p

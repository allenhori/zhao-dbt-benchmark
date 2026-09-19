select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v2 / 2.0, 4) as v1,
    case when p.v2 > p.v1 then p.v2 else p.v1 end as v2,
    p.v2 + 5 as v3,
    p.v2 * 7 as v4,
    round(p.v6 / 5.0, 4) as v5,
    p.v2 - p.v1 as v6,
    case when p.v6 > 500 then p.v6 else 0 end as v7,
    p.v2 - p.v1 as v8
from {{ ref('int_ev_0005') }} as p

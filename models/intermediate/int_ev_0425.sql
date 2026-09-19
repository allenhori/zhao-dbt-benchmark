select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v2 / 13.0, 4) as v1,
    p.v3 - p.v2 as v2,
    p.v3 * 11 as v3,
    case when p.v4 > p.v2 then p.v4 else p.v2 end as v4,
    p.v2 + 3 as v5,
    p.v2 + 13 as v6,
    round(p.v2 / 5.0, 4) as v7,
    case when p.v2 > 200 then p.v2 else 0 end as v8
from {{ ref('int_ev_0012') }} as p

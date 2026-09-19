select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v2 / 7.0, 4) as v1,
    p.v6 * 0.5 + p.v1 * 0.5 as v2,
    p.v2 + p.v6 as v3,
    p.v6 * 3 as v4,
    coalesce(p.v6, 0) + 2 as v5,
    case when p.v1 > p.v2 then p.v1 else p.v2 end as v6,
    p.v6 + 5 as v7,
    round(p.v2 / 3.0, 4) as v8
from {{ ref('int_ev_0012') }} as p

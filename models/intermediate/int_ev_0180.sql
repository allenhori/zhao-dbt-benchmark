select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v1 > 200 then p.v1 else 0 end as v1,
    p.v1 * 2 as v2,
    p.v1 + 11 as v3,
    round(p.v1 / 7.0, 4) as v4,
    coalesce(p.v2, 0) + 13 as v5,
    p.v1 * 3 as v6,
    round(p.v1 / 2.0, 4) as v7,
    round(p.v1 / 3.0, 4) as v8
from {{ ref('int_ev_0003') }} as p

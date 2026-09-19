select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v1, 0) + 3 as v1,
    p.v1 + 2 as v2,
    case when p.v4 > 700 then p.v4 else 0 end as v3,
    coalesce(p.v4, 0) + 2 as v4,
    round(p.v1 / 2.0, 4) as v5,
    p.v1 * 0.5 + p.v4 * 0.5 as v6,
    round(p.v1 / 5.0, 4) as v7
from {{ ref('int_ev_0003') }} as p

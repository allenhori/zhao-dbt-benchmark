select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v3, 0) + 11 as v1,
    round(p.v3 / 7.0, 4) as v2,
    coalesce(p.v4, 0) + 3 as v3,
    case when p.v3 > p.v4 then p.v3 else p.v4 end as v4,
    p.v4 * 0.5 + p.v3 * 0.5 as v5,
    coalesce(p.v4, 0) + 3 as v6,
    p.v4 - p.v3 as v7,
    p.v4 * 13 as v8
from {{ ref('int_ev_0022') }} as p

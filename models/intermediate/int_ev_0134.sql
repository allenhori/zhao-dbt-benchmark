select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v4 > 500 then p.v4 else 0 end as v1,
    p.v7 * 11 as v2,
    case when p.v4 > p.v6 then p.v4 else p.v6 end as v3,
    p.v7 + 3 as v4,
    coalesce(p.v4, 0) + 5 as v5,
    p.v7 * 0.5 + p.v4 * 0.5 as v6,
    p.v4 + p.v7 as v7,
    round(p.v7 / 7.0, 4) as v8
from {{ ref('int_ev_0025') }} as p

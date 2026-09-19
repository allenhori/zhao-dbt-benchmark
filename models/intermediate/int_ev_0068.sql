select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v2 > 700 then p.v2 else 0 end as v1,
    coalesce(p.v2, 0) + 5 as v2,
    case when p.v2 > 1300 then p.v2 else 0 end as v3,
    round(p.v2 / 5.0, 4) as v4,
    p.v2 * 0.5 + p.v7 * 0.5 as v5,
    p.v7 - p.v2 as v6,
    case when p.v7 > p.v2 then p.v7 else p.v2 end as v7,
    round(p.v7 / 13.0, 4) as v8
from {{ ref('int_ev_0057') }} as p

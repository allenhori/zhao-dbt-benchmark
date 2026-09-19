select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v2 + p.v6 as v1,
    case when p.v2 > 1300 then p.v2 else 0 end as v2,
    p.v2 + 13 as v3,
    coalesce(p.v2, 0) + 3 as v4,
    case when p.v6 > 200 then p.v6 else 0 end as v5,
    p.v7 * 7 as v6,
    p.v6 + p.v7 as v7,
    round(p.v2 / 5.0, 4) as v8
from {{ ref('int_ev_0016') }} as p

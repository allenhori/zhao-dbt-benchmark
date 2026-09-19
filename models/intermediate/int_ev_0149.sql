select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v3, 0) + 5 as v1,
    case when p.v7 > 300 then p.v7 else 0 end as v2,
    round(p.v4 / 5.0, 4) as v3,
    p.v3 * 7 as v4,
    p.v4 + p.v3 as v5,
    p.v4 + p.v3 as v6,
    round(p.v3 / 3.0, 4) as v7,
    round(p.v7 / 13.0, 4) as v8
from {{ ref('int_ev_0014') }} as p

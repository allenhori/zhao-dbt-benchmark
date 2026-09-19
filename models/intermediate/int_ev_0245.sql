select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v5 > 700 then p.v5 else 0 end as v1,
    round(p.v5 / 7.0, 4) as v2,
    case when p.v5 > 300 then p.v5 else 0 end as v3,
    p.v4 - p.v5 as v4,
    p.v4 - p.v5 as v5,
    p.v4 - p.v5 as v6,
    p.v4 + 5 as v7,
    p.v5 * 0.5 + p.v4 * 0.5 as v8
from {{ ref('int_ev_0014') }} as p

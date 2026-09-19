select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v2 * 0.5 + p.v4 * 0.5 as v1,
    p.v2 - p.v4 as v2,
    case when p.v4 > 200 then p.v4 else 0 end as v3,
    p.v4 + 3 as v4,
    round(p.v2 / 3.0, 4) as v5,
    case when p.v4 > 300 then p.v4 else 0 end as v6,
    case when p.v4 > p.v2 then p.v4 else p.v2 end as v7
from {{ ref('int_ev_0062') }} as p

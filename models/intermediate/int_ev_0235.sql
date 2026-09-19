select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v2 > 300 then p.v2 else 0 end as v1,
    p.v4 - p.v2 as v2,
    p.v1 + 5 as v3,
    round(p.v4 / 13.0, 4) as v4,
    p.v1 - p.v2 as v5,
    p.v4 + p.v2 as v6
from {{ ref('int_ev_0016') }} as p

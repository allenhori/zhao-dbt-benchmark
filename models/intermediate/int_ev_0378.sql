select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v4 / 2.0, 4) as v1,
    p.v1 + 3 as v2,
    p.v1 + p.v4 as v3,
    p.v3 - p.v1 as v4,
    p.v1 - p.v4 as v5,
    p.v3 + 7 as v6,
    case when p.v4 > 300 then p.v4 else 0 end as v7
from {{ ref('int_ev_0013') }} as p

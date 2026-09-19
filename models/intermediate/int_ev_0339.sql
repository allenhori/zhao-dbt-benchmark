select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v4 > p.v1 then p.v4 else p.v1 end as v1,
    p.v1 * 5 as v2,
    case when p.v1 > 700 then p.v1 else 0 end as v3,
    p.v4 - p.v1 as v4,
    p.v1 + 2 as v5,
    round(p.v1 / 11.0, 4) as v6
from {{ ref('int_ev_0012') }} as p

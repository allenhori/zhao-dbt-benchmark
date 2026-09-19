select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v5 + 7 as v1,
    case when p.v5 > 1100 then p.v5 else 0 end as v2,
    case when p.v5 > 1100 then p.v5 else 0 end as v3,
    case when p.v2 > p.v5 then p.v2 else p.v5 end as v4,
    case when p.v2 > 500 then p.v2 else 0 end as v5,
    round(p.v5 / 5.0, 4) as v6,
    p.v2 - p.v5 as v7
from {{ ref('int_ev_0237') }} as p

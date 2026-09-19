select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v2 > p.v1 then p.v2 else p.v1 end as v1,
    round(p.v2 / 5.0, 4) as v2,
    round(p.v1 / 3.0, 4) as v3,
    p.v1 + 7 as v4,
    round(p.v1 / 7.0, 4) as v5,
    case when p.v2 > p.v1 then p.v2 else p.v1 end as v6,
    coalesce(p.v2, 0) + 2 as v7
from {{ ref('int_ev_0263') }} as p

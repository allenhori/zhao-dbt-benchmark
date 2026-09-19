select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v5 + p.v7 as v1,
    round(p.v7 / 2.0, 4) as v2,
    round(p.v5 / 2.0, 4) as v3,
    case when p.v5 > 500 then p.v5 else 0 end as v4,
    case when p.v5 > 300 then p.v5 else 0 end as v5,
    coalesce(p.v5, 0) + 3 as v6
from {{ ref('int_ev_0002') }} as p

select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v1 + p.v5 as v1,
    coalesce(p.v1, 0) + 2 as v2,
    coalesce(p.v5, 0) + 13 as v3,
    p.v5 + 13 as v4,
    case when p.v2 > p.v5 then p.v2 else p.v5 end as v5,
    round(p.v2 / 13.0, 4) as v6
from {{ ref('int_ev_0095') }} as p

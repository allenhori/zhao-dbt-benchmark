select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v5 + 13 as v1,
    p.v7 + 2 as v2,
    case when p.v2 > 500 then p.v2 else 0 end as v3,
    coalesce(p.v5, 0) + 5 as v4,
    p.v7 - p.v2 as v5,
    p.v2 + 2 as v6
from {{ ref('int_ev_0019') }} as p

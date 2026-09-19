select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v1 > 1300 then p.v1 else 0 end as v1,
    round(p.v3 / 3.0, 4) as v2,
    round(p.v3 / 5.0, 4) as v3,
    coalesce(p.v3, 0) + 3 as v4,
    coalesce(p.v1, 0) + 3 as v5,
    p.v1 + p.v3 as v6
from {{ ref('int_ev_0012') }} as p

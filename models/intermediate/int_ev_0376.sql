select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v5 + 5 as v1,
    round(p.v5 / 5.0, 4) as v2,
    round(p.v3 / 13.0, 4) as v3,
    coalesce(p.v5, 0) + 7 as v4,
    case when p.v5 > 200 then p.v5 else 0 end as v5,
    p.v3 + 5 as v6,
    p.v5 + 2 as v7
from {{ ref('int_ev_0080') }} as p

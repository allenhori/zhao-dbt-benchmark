select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v4 + p.v1 as v1,
    coalesce(p.v4, 0) + 7 as v2,
    p.v4 * 2 as v3,
    round(p.v1 / 3.0, 4) as v4,
    p.v4 * 7 as v5,
    case when p.v4 > 1300 then p.v4 else 0 end as v6
from {{ ref('int_ev_0003') }} as p

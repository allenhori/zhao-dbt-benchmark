select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v1, 0) + 3 as v1,
    p.v1 - p.v5 as v2,
    case when p.v6 > 200 then p.v6 else 0 end as v3,
    p.v6 * 5 as v4,
    coalesce(p.v1, 0) + 5 as v5,
    round(p.v1 / 2.0, 4) as v6
from {{ ref('int_ev_0010') }} as p

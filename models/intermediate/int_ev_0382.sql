select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v6 * 2 as v1,
    coalesce(p.v4, 0) + 11 as v2,
    p.v4 + p.v6 as v3,
    round(p.v6 / 5.0, 4) as v4,
    p.v6 - p.v4 as v5,
    case when p.v6 > p.v4 then p.v6 else p.v4 end as v6
from {{ ref('int_ev_0005') }} as p

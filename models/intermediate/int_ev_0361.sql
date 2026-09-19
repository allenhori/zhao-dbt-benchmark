select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v5, 0) + 7 as v1,
    round(p.v4 / 13.0, 4) as v2,
    case when p.v4 > p.v5 then p.v4 else p.v5 end as v3,
    p.v4 + 2 as v4,
    coalesce(p.v5, 0) + 13 as v5,
    case when p.v4 > p.v5 then p.v4 else p.v5 end as v6,
    p.v5 * 2 as v7
from {{ ref('int_ev_0018') }} as p

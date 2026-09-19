select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v3 > 1100 then p.v3 else 0 end as v1,
    p.v6 + p.v3 as v2,
    case when p.v6 > p.v3 then p.v6 else p.v3 end as v3,
    round(p.v6 / 7.0, 4) as v4,
    coalesce(p.v6, 0) + 13 as v5,
    p.v6 + 11 as v6
from {{ ref('int_ev_0028') }} as p

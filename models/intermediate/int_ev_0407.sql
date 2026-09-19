select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v5 + 5 as v1,
    p.v5 * 13 as v2,
    coalesce(p.v5, 0) + 5 as v3,
    p.v1 - p.v5 as v4,
    case when p.v6 > 200 then p.v6 else 0 end as v5,
    coalesce(p.v1, 0) + 11 as v6
from {{ ref('int_ev_0103') }} as p

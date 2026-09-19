select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v4 / 13.0, 4) as v1,
    case when p.v4 > 200 then p.v4 else 0 end as v2,
    p.v4 * 5 as v3,
    round(p.v4 / 11.0, 4) as v4,
    p.v4 - p.v3 as v5,
    coalesce(p.v4, 0) + 5 as v6
from {{ ref('int_ev_0001') }} as p

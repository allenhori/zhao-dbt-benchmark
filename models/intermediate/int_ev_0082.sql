select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v6 > 200 then p.v6 else 0 end as v1,
    round(p.v7 / 13.0, 4) as v2,
    coalesce(p.v4, 0) + 5 as v3,
    p.v6 * 13 as v4,
    round(p.v7 / 13.0, 4) as v5,
    p.v6 + 7 as v6,
    round(p.v4 / 7.0, 4) as v7
from {{ ref('int_ev_0046') }} as p
